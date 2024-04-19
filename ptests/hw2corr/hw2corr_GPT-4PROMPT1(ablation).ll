; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  %5 = load float, ptr %0, align 4
  %6 = fadd float %5, 0.000000e+00
  store float %6, ptr %0, align 4
  br label %7

7:                                                ; preds = %4
  %8 = load float, ptr %1, align 4
  %9 = fptosi float %8 to i32
  %10 = srem i32 %9, 2
  %11 = load float, ptr %0, align 4
  %12 = mul nsw i32 %10, 2
  %13 = sitofp i32 %12 to float
  %14 = fadd float %11, %13
  store float %14, ptr %0, align 4
  br label %15

15:                                               ; preds = %7
  %16 = load float, ptr %1, align 4
  %17 = fptosi float %16 to i32
  %18 = srem i32 %17, 3
  %19 = load float, ptr %0, align 4
  %20 = mul nsw i32 %18, 3
  %21 = sitofp i32 %20 to float
  %22 = fadd float %19, %21
  store float %22, ptr %0, align 4
  br label %23

23:                                               ; preds = %15
  %24 = load float, ptr %1, align 4
  %25 = fptosi float %24 to i32
  %26 = srem i32 %25, 4
  %27 = load float, ptr %0, align 4
  %28 = mul nsw i32 %26, 4
  %29 = sitofp i32 %28 to float
  %30 = fadd float %27, %29
  store float %30, ptr %0, align 4
  br label %31

31:                                               ; preds = %23
  %32 = load float, ptr %1, align 4
  %33 = fptosi float %32 to i32
  %34 = srem i32 %33, 5
  %35 = load float, ptr %0, align 4
  %36 = mul nsw i32 %34, 5
  %37 = sitofp i32 %36 to float
  %38 = fadd float %35, %37
  store float %38, ptr %0, align 4
  br label %39

39:                                               ; preds = %31
  %40 = load float, ptr %1, align 4
  %41 = fptosi float %40 to i32
  %42 = srem i32 %41, 6
  %43 = load float, ptr %0, align 4
  %44 = mul nsw i32 %42, 6
  %45 = sitofp i32 %44 to float
  %46 = fadd float %43, %45
  store float %46, ptr %0, align 4
  br label %47

47:                                               ; preds = %39
  %48 = load float, ptr %1, align 4
  %49 = fptosi float %48 to i32
  %50 = srem i32 %49, 7
  %51 = load float, ptr %0, align 4
  %52 = mul nsw i32 %50, 7
  %53 = sitofp i32 %52 to float
  %54 = fadd float %51, %53
  store float %54, ptr %0, align 4
  br label %55

55:                                               ; preds = %47
  %56 = load float, ptr %1, align 4
  %57 = fptosi float %56 to i32
  %58 = srem i32 %57, 8
  %59 = load float, ptr %0, align 4
  %60 = mul nsw i32 %58, 8
  %61 = sitofp i32 %60 to float
  %62 = fadd float %59, %61
  store float %62, ptr %0, align 4
  br label %63

63:                                               ; preds = %55
  %64 = load float, ptr %1, align 4
  %65 = fptosi float %64 to i32
  %66 = srem i32 %65, 9
  %67 = load float, ptr %0, align 4
  %68 = mul nsw i32 %66, 9
  %69 = sitofp i32 %68 to float
  %70 = fadd float %67, %69
  store float %70, ptr %0, align 4
  br i1 false, label %71, label %79

71:                                               ; preds = %63
  %72 = load float, ptr %1, align 4
  %73 = fptosi float %72 to i32
  %74 = srem i32 %73, 10
  %75 = load float, ptr %0, align 4
  %76 = mul nsw i32 %74, 10
  %77 = sitofp i32 %76 to float
  %78 = fadd float %75, %77
  store float %78, ptr %0, align 4
  unreachable

79:                                               ; preds = %63
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %7, %2
  %.05 = phi float [ undef, %2 ], [ %11, %7 ]
  %.04 = phi float [ undef, %2 ], [ %17, %7 ]
  %.03 = phi float [ 5.813000e+03, %2 ], [ %16, %7 ]
  %.02 = phi i64 [ 1, %2 ], [ %.1, %7 ]
  %.01 = phi i64 [ 1907, %2 ], [ %9, %7 ]
  %.0 = phi i64 [ 1, %2 ], [ %23, %7 ]
  %6 = icmp ult i64 %.0, 40000001
  br i1 %6, label %7, label %24

7:                                                ; preds = %5
  %8 = mul nuw nsw i64 %.01, 27611
  %9 = urem i64 %8, 74383
  %10 = sitofp i64 %9 to float
  %11 = fdiv float %10, 7.438300e+04
  %12 = fmul float %.03, 1.307000e+03
  %13 = fdiv float %12, 5.471000e+03
  %14 = fptosi float %13 to i64
  %15 = sitofp i64 %14 to float
  %16 = call float @llvm.fmuladd.f32(float %15, float -5.471000e+03, float %12)
  %17 = fdiv float %16, 5.471000e+03
  %18 = fmul float %17, %17
  %19 = call float @llvm.fmuladd.f32(float %11, float %11, float %18)
  store float %19, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %20 = load float, ptr %4, align 4
  %21 = fcmp ugt float %20, 1.000000e+00
  %22 = add nsw i64 %.02, 1
  %.1 = select i1 %21, i64 %.02, i64 %22
  %23 = add nuw nsw i64 %.0, 1
  br label %5, !llvm.loop !6

24:                                               ; preds = %5
  %.05.lcssa = phi float [ %.05, %5 ]
  %.04.lcssa = phi float [ %.04, %5 ]
  %.02.lcssa = phi i64 [ %.02, %5 ]
  %.0.lcssa = phi i64 [ %.0, %5 ]
  %25 = fpext float %.05.lcssa to double
  %26 = fpext float %.04.lcssa to double
  %27 = trunc i64 %.02.lcssa to i32
  %28 = trunc i64 %.0.lcssa to i32
  %29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %25, double noundef %26, i32 noundef %27, i32 noundef %28) #4
  %30 = sitofp i64 %.02.lcssa to float
  %31 = fpext float %30 to double
  %32 = fmul double %31, 4.000000e+00
  %33 = fdiv double %32, 4.000000e+07
  %34 = fptrunc double %33 to float
  %35 = fpext float %34 to double
  %36 = load float, ptr %3, align 4
  %37 = fpext float %36 to double
  %38 = fmul double %37, 0.000000e+00
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %35, double noundef %38, i32 noundef 40000000) #4
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
