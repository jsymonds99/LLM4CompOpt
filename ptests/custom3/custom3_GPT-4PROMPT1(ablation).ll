; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %1, %2
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %2 ]
  %3 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5
  %4 = load i32, ptr %3, align 4
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %4) #4
  %6 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5, i64 1
  %7 = load i32, ptr %6, align 4
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %7) #4
  %9 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5, i64 2
  %10 = load i32, ptr %9, align 4
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %10) #4
  %12 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5, i64 3
  %13 = load i32, ptr %12, align 4
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13) #4
  %15 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv5, i64 4
  %16 = load i32, ptr %15, align 4
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %16) #4
  %putchar = tail call i32 @putchar(i32 10)
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8.not = icmp eq i64 %indvars.iv.next6, 5
  br i1 %exitcond8.not, label %18, label %2, !llvm.loop !6

18:                                               ; preds = %2
  %putchar9 = tail call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %1, %92
  %indvars.iv17 = phi i64 [ 0, %1 ], [ %indvars.iv.next18, %92 ]
  br label %3

3:                                                ; preds = %2, %91
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %91 ]
  %.phi.trans.insert21 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv17, i64 %indvars.iv
  %.pre = load i32, ptr %.phi.trans.insert21, align 4
  br label %4

4:                                                ; preds = %3, %89
  %5 = phi i32 [ %.pre, %3 ], [ %87, %89 ]
  %.039 = phi i32 [ 0, %3 ], [ %90, %89 ]
  %6 = add nsw i32 %5, %.039
  store i32 %6, ptr %.phi.trans.insert21, align 4
  br label %7

7:                                                ; preds = %4, %88
  %8 = phi i32 [ %6, %4 ], [ %87, %88 ]
  %.048 = phi i32 [ 0, %4 ], [ %9, %88 ]
  %9 = add nuw nsw i32 %.048, 1
  %10 = mul nsw i32 %8, %9
  store i32 %10, ptr %.phi.trans.insert21, align 4
  br label %11

11:                                               ; preds = %7
  store i32 %10, ptr %.phi.trans.insert21, align 4
  br label %12

12:                                               ; preds = %11
  br label %13

13:                                               ; preds = %12
  %14 = add nsw i32 %10, -1
  store i32 %14, ptr %.phi.trans.insert21, align 4
  br label %15

15:                                               ; preds = %13
  br label %16

16:                                               ; preds = %15
  %17 = add nsw i32 %14, 2
  store i32 %17, ptr %.phi.trans.insert21, align 4
  br label %18

18:                                               ; preds = %16
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %17, -3
  store i32 %20, ptr %.phi.trans.insert21, align 4
  br label %21

21:                                               ; preds = %19
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %20, 4
  store i32 %23, ptr %.phi.trans.insert21, align 4
  br label %24

24:                                               ; preds = %22
  %25 = add nuw nsw i64 %indvars.iv17, %indvars.iv
  %26 = trunc i64 %25 to i32
  %27 = sub nsw i32 %23, %26
  store i32 %27, ptr %.phi.trans.insert21, align 4
  br label %28

28:                                               ; preds = %24
  store i32 %27, ptr %.phi.trans.insert21, align 4
  br label %29

29:                                               ; preds = %28
  br label %30

30:                                               ; preds = %29
  %31 = add nsw i32 %27, -1
  store i32 %31, ptr %.phi.trans.insert21, align 4
  br label %32

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %32
  %34 = add nsw i32 %31, 2
  store i32 %34, ptr %.phi.trans.insert21, align 4
  br label %35

35:                                               ; preds = %33
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %34, -3
  store i32 %37, ptr %.phi.trans.insert21, align 4
  br label %38

38:                                               ; preds = %36
  br label %39

39:                                               ; preds = %38
  %40 = add nsw i32 %37, 4
  store i32 %40, ptr %.phi.trans.insert21, align 4
  br label %41

41:                                               ; preds = %39
  %42 = shl nuw nsw i32 %26, 1
  %43 = sub nsw i32 %40, %42
  store i32 %43, ptr %.phi.trans.insert21, align 4
  br label %44

44:                                               ; preds = %41
  store i32 %43, ptr %.phi.trans.insert21, align 4
  br label %45

45:                                               ; preds = %44
  br label %46

46:                                               ; preds = %45
  %47 = add nsw i32 %43, -1
  store i32 %47, ptr %.phi.trans.insert21, align 4
  br label %48

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %47, 2
  store i32 %50, ptr %.phi.trans.insert21, align 4
  br label %51

51:                                               ; preds = %49
  br label %52

52:                                               ; preds = %51
  %53 = add nsw i32 %50, -3
  store i32 %53, ptr %.phi.trans.insert21, align 4
  br label %54

54:                                               ; preds = %52
  br label %55

55:                                               ; preds = %54
  %56 = add nsw i32 %53, 4
  store i32 %56, ptr %.phi.trans.insert21, align 4
  br label %57

57:                                               ; preds = %55
  %.neg = mul i32 %26, -3
  %58 = add i32 %.neg, %56
  store i32 %58, ptr %.phi.trans.insert21, align 4
  br label %59

59:                                               ; preds = %57
  store i32 %58, ptr %.phi.trans.insert21, align 4
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  %62 = add nsw i32 %58, -1
  store i32 %62, ptr %.phi.trans.insert21, align 4
  br label %63

63:                                               ; preds = %61
  br label %64

64:                                               ; preds = %63
  %65 = add nsw i32 %62, 2
  store i32 %65, ptr %.phi.trans.insert21, align 4
  br label %66

66:                                               ; preds = %64
  br label %67

67:                                               ; preds = %66
  %68 = add nsw i32 %65, -3
  store i32 %68, ptr %.phi.trans.insert21, align 4
  br label %69

69:                                               ; preds = %67
  br label %70

70:                                               ; preds = %69
  %71 = add nsw i32 %68, 4
  store i32 %71, ptr %.phi.trans.insert21, align 4
  br label %72

72:                                               ; preds = %70
  %73 = shl nuw nsw i32 %26, 2
  %74 = sub nsw i32 %71, %73
  store i32 %74, ptr %.phi.trans.insert21, align 4
  br label %75

75:                                               ; preds = %72
  store i32 %74, ptr %.phi.trans.insert21, align 4
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76
  %78 = add nsw i32 %74, -1
  store i32 %78, ptr %.phi.trans.insert21, align 4
  br label %79

79:                                               ; preds = %77
  br label %80

80:                                               ; preds = %79
  %81 = add nsw i32 %78, 2
  store i32 %81, ptr %.phi.trans.insert21, align 4
  br label %82

82:                                               ; preds = %80
  br label %83

83:                                               ; preds = %82
  %84 = add nsw i32 %81, -3
  store i32 %84, ptr %.phi.trans.insert21, align 4
  br label %85

85:                                               ; preds = %83
  br label %86

86:                                               ; preds = %85
  %87 = add nsw i32 %84, 4
  store i32 %87, ptr %.phi.trans.insert21, align 4
  br label %88

88:                                               ; preds = %86
  %exitcond13.not = icmp eq i32 %9, 5
  br i1 %exitcond13.not, label %89, label %7, !llvm.loop !8

89:                                               ; preds = %88
  %90 = add nuw nsw i32 %.039, 1
  %exitcond14.not = icmp eq i32 %90, 5
  br i1 %exitcond14.not, label %91, label %4, !llvm.loop !9

91:                                               ; preds = %89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond16.not, label %92, label %3, !llvm.loop !10

92:                                               ; preds = %91
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20.not = icmp eq i64 %indvars.iv.next18, 5
  br i1 %exitcond20.not, label %93, label %2, !llvm.loop !11

93:                                               ; preds = %92
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %0, %2
  %indvars.iv5 = phi i64 [ 0, %0 ], [ %indvars.iv.next6, %2 ]
  %3 = tail call i32 @rand() #4
  %4 = srem i32 %3, 10
  %5 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5
  store i32 %4, ptr %5, align 4
  %6 = tail call i32 @rand() #4
  %7 = srem i32 %6, 10
  %8 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5, i64 1
  store i32 %7, ptr %8, align 4
  %9 = tail call i32 @rand() #4
  %10 = srem i32 %9, 10
  %11 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5, i64 2
  store i32 %10, ptr %11, align 4
  %12 = tail call i32 @rand() #4
  %13 = srem i32 %12, 10
  %14 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5, i64 3
  store i32 %13, ptr %14, align 4
  %15 = tail call i32 @rand() #4
  %16 = srem i32 %15, 10
  %17 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv5, i64 4
  store i32 %16, ptr %17, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8.not = icmp eq i64 %indvars.iv.next6, 5
  br i1 %exitcond8.not, label %18, label %2, !llvm.loop !12

18:                                               ; preds = %2
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts9 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
